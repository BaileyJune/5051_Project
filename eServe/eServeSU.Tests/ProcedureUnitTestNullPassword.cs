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
    public class ProcedureUnitTestNullPassword
    {
        public TestContext TestContext { get; set; }
        public string ConnectionString = ConfigurationManager.ConnectionStrings["eServeConnection"].ConnectionString;

        [TestMethod]
        public void Test_VerifyUser_NullPassword()
        {
            //Initialize SqlQueryHelper object
            var sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();

            var roleID = 0;
            Int32 roleNum = role();

            Assert.AreEqual(roleID, roleNum);
        }


        public int role()
        {
            DatabaseHelper dbHelper = new DatabaseHelper();
            dbHelper.DbConnection = ConfigurationManager.ConnectionStrings["eServeConnection"].ConnectionString;

            var reader = dbHelper.VerifyUser(Constant.sp_VerifyUser, "madiganz@seattleu.edu", "");
            int num = 0;
            while (reader.Read())
            {
                num = Convert.ToInt32(reader["RoleID"]);

            }

            return num;
        }
    }
}
