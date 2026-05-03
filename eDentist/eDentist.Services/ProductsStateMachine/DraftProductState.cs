using AutoMapper;
using Azure.Core;
using EasyNetQ;
using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Services.Database;
using Microsoft.Extensions.Logging;
using RabbitMQ.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.ProizvodiStateMachine
{
    public class DraftProductState : BaseState
    {
        protected ILogger<DraftProductState> _logger;
        public DraftProductState(ILogger<DraftProductState> logger,IServiceProvider serviceProvider, EDentistDbContext context, IMapper mapper) : base(serviceProvider, context, mapper)
        {
            _logger = logger;
        }

        public override async Task<ProductModel> Update(int id, ProductUpdateRequest request)
        {
            var table = _context.Set<Product>();
            Product entity = await table.FindAsync(id);
            _mapper.Map(request, entity);
            await _context.SaveChangesAsync();
            return _mapper.Map<ProductModel>(entity);
        }

        public override async Task<ProductModel> Activate(int id)
        {
            _logger.LogInformation($"Aktivacija proizvoda: {id}");

            _logger.LogWarning($"W: Aktivacija proizvoda: {id}");

            _logger.LogError($"E: Aktivacija proizvoda: {id}");
            var table = _context.Set<Product>();
            Product entity = await table.FindAsync(id);
            entity.StateMachine = "active";


            await _context.SaveChangesAsync();


            //var factory = new ConnectionFactory { HostName = "localhost" };
            //using var connection = factory.CreateConnection();
            //using var channel = connection.CreateModel();


            //string message = "";

            ////JSON$"{entity.ProizvodId}, {entity.Sifra}, {entity.Naziv}";
            //var body = Encoding.UTF8.GetBytes(message);

            //channel.BasicPublish(exchange: string.Empty,
            //                     routingKey: "product_added",
            //                     basicProperties: null,
            //                     body: body);

            var mappedEntity = _mapper.Map<ProductModel>(entity);

            using var bus = RabbitHutch.CreateBus("host=localhost");

            bus.PubSub.Publish(mappedEntity);

            return mappedEntity;
        }

        public override async Task<List<string>> AllowedActions()
        {
            var list = await base.AllowedActions();

            list.Add("Update");
            list.Add("Activate");

            return list;
        }

    }
}
