using eDentist.Model;
using eDentist.Model.Requests;
using eDentist.Model.SearchObjects;
using eDentist.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace eDentist.Controllers
{
    [ApiController]
    [Route("[controller]")]
    [AllowAnonymous]
    public class UsersController : BaseCrudController<UserModel, UsersSearchObject, UsersInsertRequest, UserUpdateRequest>
    {
        private readonly IUsersService _userService;
        public UsersController(ILogger<BaseController<UserModel, UsersSearchObject>> logger, IUsersService service) : base(logger,service)
        {
            _userService=service;
        }

        
        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LogInRequest loginRequest)
        {
           
            try
            {
                var user = await _userService.Login(loginRequest.Username, loginRequest.Password);

                if (user == null)
                {
                    return BadRequest("Invalid username or password");
                }

                return Ok(user);
            }
            catch (Exception ex)
            {
        
                _logger.LogError($"Login failed: {ex.Message}");
                return BadRequest("Internal Server Error");
            }
        }




}
}
