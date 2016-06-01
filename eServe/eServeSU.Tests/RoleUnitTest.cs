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
    public class RoleUnitTest
    {

        public TestContext TestContext { get; set; }
        public string ConnectionString = ConfigurationManager.ConnectionStrings["eServeConnection"].ConnectionString;

        [TestMethod]
        public void TestRoleTable()
        {

            //Initialize SqlQueryHelper object
            var sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();

            //Make sure there are 4 roles

            var command = new SqlCommand("select count(*) from Role", sqlConnection);
            var roleCount = Convert.ToInt32(command.ExecuteScalar());
            int test = 4;

            Assert.AreEqual(test, roleCount);
        }
    }
}
