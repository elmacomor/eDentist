using AutoMapper;
using eDentist.Model.Models;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Database;
using eDentist.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eDentist.Services.Services
{
    public class AppointmentService : BaseCrudService<AppointmentModel, Appointment, BaseSearchObject, AppointmentInsertRequest, AppointmentUpdateRequest>, IAppointmentsService
    {

        public AppointmentService(EDentistDbContext c, IMapper mapper) : base(c, mapper) { }


    }
}
