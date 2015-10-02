using OpenQA.Selenium;
using OpenQA.Selenium.Remote;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.IE;
using System;
using NUnit.Framework;

namespace se_builder
{
    [TestFixture()]
    public class UnitTest1
    {
        /// <summary>
        /// 
        /// </summary>
        [Test()]
        public void UnitTest()
        {
            //IWebDriver wd = new RemoteWebDriver(DesiredCapabilities.Firefox());
            
            //wd.Navigate().GoToUrl("http://113.128.163.253/securepay/account/login.aspx");
            DesiredCapabilities caps = DesiredCapabilities.InternetExplorer();
            caps.SetCapability("browser", "IE");
            caps.SetCapability("browser_version", "11.0");
            caps.SetCapability("os", "Windows");
            caps.SetCapability("os_version", "10");
            caps.SetCapability("resolution", "1024x768");
            IWebDriver wd = new RemoteWebDriver(new Uri("http://113.128.163.253/securepay/account/login.aspx"), caps);

            try
            {
                wd.FindElement(By.Id("MainContent_UserName")).Click();
                wd.FindElement(By.Id("MainContent_UserName")).Clear();
                wd.FindElement(By.Id("MainContent_UserName")).SendKeys("Sudhakar");
                wd.FindElement(By.Id("MainContent_Password")).Click();
                wd.FindElement(By.Id("MainContent_Password")).Clear();
                wd.FindElement(By.Id("MainContent_Password")).SendKeys("sudhakar");
                wd.FindElement(By.Id("MainContent_UserEntry")).Click();
                wd.FindElement(By.Id("MainContent_UserEntry")).Clear();
                wd.FindElement(By.Id("MainContent_UserEntry")).SendKeys("646F2");
                wd.FindElement(By.Id("MainContent_LoginButton")).Click();
                wd.FindElement(By.LinkText("Virtual Card")).Click();
                wd.FindElement(By.Id("ContentPlaceHolder1_btnAddNew")).Click();
                wd.FindElement(By.Id("ContentPlaceHolder1_txtCardNumber")).Click();
                wd.FindElement(By.Id("ContentPlaceHolder1_txtCardNumber")).Clear();
                wd.FindElement(By.Id("ContentPlaceHolder1_txtCardNumber")).SendKeys("4566882593");
                wd.FindElement(By.XPath("//div[@id='ContentPlaceHolder1_divAddCard']/table/tbody/tr[1]/td[5]")).Click();
                wd.FindElement(By.Id("ContentPlaceHolder1_txtNameonCard")).Click();
                wd.FindElement(By.Id("ContentPlaceHolder1_txtNameonCard")).Clear();
                wd.FindElement(By.Id("ContentPlaceHolder1_txtNameonCard")).SendKeys("Sudhakar");
                wd.FindElement(By.Id("ContentPlaceHolder1_txtPriority")).Click();
                wd.FindElement(By.Id("ContentPlaceHolder1_txtPriority")).Clear();
                wd.FindElement(By.Id("ContentPlaceHolder1_txtPriority")).SendKeys("2");
                wd.FindElement(By.Id("ContentPlaceHolder1_txtPercentage")).Click();
                wd.FindElement(By.Id("ContentPlaceHolder1_txtPercentage")).Clear();
                wd.FindElement(By.Id("ContentPlaceHolder1_txtPercentage")).SendKeys("20");
                if (!wd.FindElement(By.Id("ContentPlaceHolder1_chkConfirm")).Selected)
                {
                    wd.FindElement(By.Id("ContentPlaceHolder1_chkConfirm")).Click();
                }
                wd.FindElement(By.Id("ContentPlaceHolder1_btnSubmit")).Click();
                wd.FindElement(By.LinkText("Products")).Click();
            }
            finally { wd.Quit(); }
        }
    }
}
