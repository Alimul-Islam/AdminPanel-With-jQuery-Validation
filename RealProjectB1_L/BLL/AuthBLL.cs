using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Entity;


namespace BLL
{
    public class AuthBLL
    {
        AuthDAL objAuth = new AuthDAL();
        


        public DataTable CheckUserInfo(string UserName,string UPassword)
        {
            DataTable dt = new DataTable();

            dt = objAuth.LoginCheck(UserName, UPassword);

            return dt;
        }


        public int Insert_URegistrationInfo(EURegistration objEUR)
        {
            int ret = 0;

            DataTable dt = new DataTable();

            ret = objAuth.insert_URegistation(objEUR);

            return ret;
        }



    }
}
