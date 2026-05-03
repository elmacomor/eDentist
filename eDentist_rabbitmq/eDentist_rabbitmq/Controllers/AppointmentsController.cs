using eDentist.Model.Requests;
using eDentist.Services.Database;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using RabbitMQ.Client;
using System.Text;

namespace eDentist.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class AppointmentsController : ControllerBase
    {

        public AppointmentsController()
        { }

        [Authorize]
        [HttpPost]
        public async Task<IActionResult> Send(AppointmentInsertRequest appointment)
        {
            var factory = new ConnectionFactory
            {
                HostName = Environment.GetEnvironmentVariable("RABBITMQ_HOST") ?? "rabbitMQ"
            };
            using var connection = factory.CreateConnection();
            using var channel = connection.CreateModel();

            channel.QueueDeclare(queue: "appointments",
                                 durable: false,
                                 exclusive: false,
            autoDelete: true,
                                 arguments: null);


            var json = JsonConvert.SerializeObject(appointment);

            var body = Encoding.UTF8.GetBytes(json);

            Console.WriteLine($"Sending appointment: {json}");

            channel.BasicPublish(exchange: string.Empty,
                                 routingKey: "appointments",

                                 body: body);

            return Ok(appointment);
        }
    }
}
