using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eServeSU;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace eServeUnitTest
{
    [TestClass]
    public class ProcedureUnitTestPassword
    {
        public TestContext TestContext { get; set; }
        public string ConnectionString = ConfigurationManager.ConnectionStrings["eServeConnection"].ConnectionString;

        [TestMethod]
        public void Test_VerifyUser_WrongPassword()
        {
            //Initialize SqlQueryHelper object
            var sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();

            Int32 roleNum = role();
            var roleID = 0;
            Assert.AreEqual(roleID, roleNum);
        }


        public int role()
        {
            DatabaseHelper dbHelper = new DatabaseHelper();
            dbHelper.DbConnection = ConfigurationManager.ConnectionStrings["eServeConnection"].ConnectionString;

            var reader = dbHelper.VerifyUser(Constant.sp_VerifyUser, "janedoe@yahoo.com", "Test134!");
            int num = 0;
            while (reader.Read())
            {
                num = Convert.ToInt32(reader["RoleID"]);

            }

            return num;
        }
    }
}
