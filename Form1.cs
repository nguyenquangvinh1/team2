using Dự_án_1__nhóm_2.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Dự_án_1__nhóm_2
{
    public partial class fdangnhap : Form
    {
        public fdangnhap()
        {
            InitializeComponent();
        }

        private void fdangnhap_Load(object sender, EventArgs e)
        {

        }

        private void fdangnhap_FormClosing(object sender, FormClosingEventArgs e)
        {
            if(MessageBox.Show("Bạn có muốn thoát?","Thông báo",MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
            {
                e.Cancel = true;
            }    
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text; 
            if (login(username,password))
            {
                ftableManager f = new ftableManager();
                this.Hide();
                f.ShowDialog();
                this.Show();
            }else
            {
                MessageBox.Show("Sai tên đăng nhập và mật khẩu");
            }
        }
        bool login( string username, string password)
        {
            return AccountDAO.Instance.Login(username,password);

           
        }
    }
}
