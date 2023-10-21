using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace BasicsCRUD.Models
{
    public class ClientsModel
    {
        public int? ClientID { get; set; }

        [Required(ErrorMessage = "Firstname is Required")]
        [DisplayName("First Name")]
        [StringLength(maximumLength: 80, MinimumLength = 1)]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Lastname is Required")]
        [DisplayName("Last name")]
        [StringLength(maximumLength: 80, MinimumLength = 1)]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Age is Required")]
        [DisplayName("Age")]
        [Range(1, 120, ErrorMessage = "Age must be between 1 and 120.")]
        public int Age { get; set; }

        [Required(ErrorMessage = "Email is Required")]
        [DisplayName("Email")]
        [StringLength(maximumLength: 100, MinimumLength = 1)]
        public string Email { get; set; }

        [DisplayName("Gender")]
        [StringLength(maximumLength: 30, MinimumLength = 1)]
        public string? Gender { get; set; }
    }
}