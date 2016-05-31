using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eServeSU;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace eServeSU.Tests
{
    [TestClass]
    public class RolesUnitTest
    {

        public TestContext TestContext { get; set; }
        public string ConnectionString = ConfigurationManager.ConnectionStrings["eServeConnection"].ConnectionString;

        [TestMethod]
        public void Test_getRoleFromDB()
        {

            //Initialize SqlQueryHelper object
            var sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();

            var command = new SqlCommand("select * from UserLogin where RoleID = 3", sqlConnection);
            var rolesRegisteredCount = Convert.ToInt32(command.ExecuteScalar());

            DatabaseHelper DB = new DatabaseHelper();
            //DB.VerifyUser("select * from UserLogin where RoleID = 3", "madiganz@seattleu.edu", "madiganz", 3);
            //DB.VerifyUser("select * from UserLogin where RoleID = 3", "madiganz@seattleu.edu", "madiganz", 2);
            //DB.GetType("select * from UserLogin where RoleID = 3");

            List<string> students = GetAllStudents();
            Assert.AreEqual(rolesRegisteredCount, students.Count);
        }

        public List<string> GetAllStudents()
        {
            var reader = dbHelper.GetType(Constant.SP_GetStudentList);

            List<string> studentList = new List<string>();

            while (reader.Read())
            {
                //communityPartner = new CommunityPartner();
                //communityPartner.CommunityPartnerId = Convert.ToInt32(reader["CommunityPartnerId"]);
                //communityPartner.OrganizationName = reader["OrganizationName"].ToString();

                studentList.Add(reader["email"].ToString());
            }

            return studentList;
        }
    }
}
