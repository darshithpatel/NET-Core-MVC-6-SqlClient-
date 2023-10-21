using BasicsCRUD.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;

namespace BasicsCRUD.Controllers
{
    public class ClientsController : Controller
    {
        #region Private IConfiguration Variable

        private IConfiguration Configuration;

        #endregion

        #region Constructor

        public ClientsController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        #endregion

        #region SelectAll (READ)
        public IActionResult Index()
        {
            DataTable dt = new DataTable();
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_Clients_SelectAll";
            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            return View("ClientsList", dt);
        }
        #endregion

        #region Populating form / Redirecting if want to add NEW client
        public IActionResult Add(int ClientID)
        {
            if (ClientID != null)
            {
                string str = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection conn = new SqlConnection(str);
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_Clients_SelectByPK";
                cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = ClientID;
                DataTable dt = new DataTable();
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
                ClientsModel modelClients = new ClientsModel();

                foreach (DataRow dr in dt.Rows)
                {
                    modelClients.ClientID = Convert.ToInt32(dr["ClientID"]);
                    modelClients.FirstName = dr["FirstName"].ToString();
                    modelClients.LastName = dr["LastName"].ToString();
                    modelClients.Age = Convert.ToInt32(dr["Age"]);
                    modelClients.Email = dr["Email"].ToString();
                    modelClients.Gender = dr["Gender"].ToString();
                }
                return View("ClientsAddEdit", modelClients);
            }

            return View("ClientsAddEdit");
        }
        #endregion

        #region Insert(Save) (CREATE / UPDATE)
        [HttpPost]
        public IActionResult Save(ClientsModel modelClients)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;

            if (modelClients.ClientID == null)
            {
                cmd.CommandText = "PR_Clients_Insert";
            }
            else
            {
                cmd.CommandText = "PR_Clients_UpdateByPK";
                cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = modelClients.ClientID;
            }

            cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = modelClients.FirstName;
            cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = modelClients.LastName;
            cmd.Parameters.Add("@Age", SqlDbType.Int).Value = modelClients.Age;
            cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = modelClients.Email;
            cmd.Parameters.Add("@Gender", SqlDbType.NVarChar).Value = modelClients.Gender;

            if (Convert.ToBoolean(cmd.ExecuteNonQuery()))
            {
                if (modelClients.ClientID == null)
                    TempData["ClientInsertMsg"] = "Client registered successfully.";
                else
                    return RedirectToAction("Index");
            }

            conn.Close();
            return RedirectToAction("Index");

        }
        #endregion

        #region Delete (DELETE)
        public IActionResult Delete(int ClientID)
        {
            DataTable dt = new DataTable();
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_Clients_Delete";
            cmd.Parameters.AddWithValue("@ClientID", ClientID);
            cmd.ExecuteNonQuery();
            conn.Close();
            return RedirectToAction("Index");
        }
        #endregion
    }
}

