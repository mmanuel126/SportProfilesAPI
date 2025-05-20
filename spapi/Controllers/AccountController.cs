using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using spapi.Interfaces;
using spapi.Models.Account;

namespace spapi.Controllers
{
    [Route("services/[controller]")]
    [SwaggerTag("This is a list of interfaces containing member account functionalities such as registering and loging in users.")]
    public class AccountController(IConfiguration configuration, IAccountService accountService) : ControllerBase
    {
        readonly IConfiguration _configuration = configuration;
        readonly IAccountService _accountService = accountService;

        /// <summary>
        /// creates JWT token if user is authenticated and allow user login.
        /// </summary>
        /// <param name="loginModel">The login credentials data.</param>
        /// <returns></returns>
        [HttpPost]
        [Route("login")]
        public IActionResult Login([FromBody] LoginModel loginModel)
        {
            if (ModelState.IsValid)
            {
                return Ok(_accountService.AuthenticateUser(loginModel.Email, loginModel.Password));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Login new registered user.
        /// </summary>
        /// <param name="body">The data model for the new registered user.</param>
        /// <returns></returns>
        [HttpPost]
        [Route("loginNewRegisteredUser")]
        public IActionResult LoginNewRegisteredUser([FromBody] NewRegisteredUser body)
        {
            if (ModelState.IsValid)
            {
                return Ok(_accountService.AuthenticateNewRegisteredUser(body.Email, body.Code));
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Refreshes a given token.
        /// </summary>
        /// <param name="accessToken">the old token that is to be refreshed.</param>
        /// <returns></returns>
        [HttpPost]
        [Route("refreshLogin")]
        public IActionResult RefreshToken([FromQuery] string accessToken)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            return Ok(_accountService.RefreshToken(accessToken));
        }

        /// <summary>
        /// Registers a user.
        /// </summary>
        /// <param name="body">The user's information to register.</param>
        /// <returns></returns>
        [HttpPost]
        [Route("register")]
        public IActionResult RegisterUser([FromBody] RegisterModel body)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            return Ok(_accountService.CreateNewUser(body.FirstName, body.LastName, body.Email, body.Password, body.Day, body.Month, body.Year, body.Gender, body.ProfileType));
        }

        /// <summary>
        /// Resets the password.
        /// </summary>
        /// <returns>The password.</returns>
        /// <param name="email">Email.</param>
        [HttpGet]
        [Route("ResetPassword")]
        public IActionResult ResetPassword([FromQuery] string email)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            return Ok(_accountService.ResetPassword(email));
        }

        /// <summary>
        /// Is the reset code expired, yes or no.
        /// </summary>
        /// <returns>The reset code expired.</returns>
        /// <param name="code">Code.</param>
        [HttpGet]
        [Route("IsResetCodeExpired")]
        public IActionResult IsResetCodeExpired([FromQuery] string code)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            string strCode = code.Trim();
            return Ok(_accountService.CheckCodeExpired(Convert.ToInt32(strCode)));
        }

        /// <summary>
        /// Changes the password.
        /// </summary>
        /// <returns>The password.</returns>
        /// <param name="pwd">Pwd.</param>
        /// <param name="email">Email.</param>
        /// <param name="code">Code.</param>
        [HttpGet]
        [Route("ChangePassword")]
        public IActionResult ChangePassword([FromQuery] string pwd,
                                       [FromQuery] string email,
                                       [FromQuery] string code)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            return Ok(_accountService.ChangePassword(pwd, email, code));
        }

    }
}
