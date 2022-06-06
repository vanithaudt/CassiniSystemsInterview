import json
from selenium import webdriver
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup
import re
import requests
from openpyxl import load_workbook


class yahoo:

    def __init__(self):
        pass

    def setup_driver(self, driverpath="C:\Driver\chromedriver.exe"):
        """
          setup driver
          :return: n/a
          """
        options = webdriver.ChromeOptions()
        options.add_experimental_option('excludeSwitches', ['enable-logging'])
        # self.driver = webdriver.Chrome(options=options)
        self.driver = webdriver.Chrome(executable_path=driverpath,
                                       chrome_options=options)
        self.driver.get("https://uk.yahoo.com/")
        try:
            button = self.driver.find_element(By.NAME, value="agree")
            if button.is_displayed():
                button.click()
        except Exception:
            print("button not found")

    def login(self, credentials={"username": "FirstTestLogin_12", "password": "TestAbc_12!"}):
        """
          login to yahoo
          :return: n/a (error )
          """
        self.find_element(By.XPATH, elementValue="//a[text()='Sign in']").click()
        self.find_element(By.ID, elementValue="login-username").send_keys(credentials['username'])
        self.find_element(By.ID, elementValue="login-signin").click()
        self.find_element(By.ID, elementValue="login-passwd").send_keys(credentials['password'])
        self.find_element(By.ID, elementValue="login-signin").click()

    def invalid_login(self,credentials={"username": "test", "password": "TestAbc_12!"}):
        """
        invalid logins
        :param credentials:
        :return: str
        """
        self.driver.get("https://uk.yahoo.com/")
        self.find_element(By.XPATH, elementValue="//a[text()='Sign in']").click()
        self.find_element(By.ID, elementValue="login-username").send_keys(credentials['username'])
        self.find_element(By.ID, elementValue="login-signin").click()
        self.driver.implicitly_wait(4)
        if not self.driver.find_element(By.ID, value="username-error").is_displayed():
           return "login unsuccessful"

    def go_to_market_data(self):
        """
          navigate to Market Data section
          :return:
          """
        self.find_element(By.ID, elementValue="root_8").click()
        self.find_element(By.XPATH, elementValue="//div[text()='Market Data']").click()
        self.find_element(By.XPATH, elementValue="//a[text()='Calendar']").click()

    def read_from_calendar_events(self):
        """
          read from calender and returns a dictonary of event calendar
          :return: dictionary
          """
        # next button click
        # self.find_element(By.XPATH, elementValue="//a//span[text()='Next']").click()

        urllink = "https://uk.finance.yahoo.com/calendar"
        headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
                                 "(KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 Edge/18.19582"}

        # connect to the url and get page
        page = requests.get(urllink, headers=headers)

        # parse with BeautifulSoup
        soup = BeautifulSoup(page.content, 'html.parser')
        pattern = re.compile(r'\s--\sData\s--\s')
        script_data = soup.find('script', text=pattern).contents[0]
        start = script_data.find('context') - 2

        # load as json file on calender event row as dictionary
        json_data = json.loads(script_data[start:-12])
        calendarDict = json_data['context']['dispatcher']['stores']['CalendarStore']['data']['rows']
        return calendarDict

    def driver_close(self):
        """
        close driver
        :return: n/a
        """
        self.driver.close()

    def find_element(self, elementObject, elementValue):
        """
          find element
          :param elementObject: ID, XPATH  etc.
          :param elementValue:  value
          :return:
          """
        try:
            self.driver.implicitly_wait(30)
            element = self.driver.find_element(elementObject, value=elementValue)
        finally:
            return element

    def get_excel_credentials(selfs):
        """
        read from excel credentials and login yahoo
        :return: n/a
        """
        filename = "resource\\Credentials.xlsx"
        wb = load_workbook(filename=filename)
        sheet_ranges = wb['Credentials']
        header = []
        header.append(sheet_ranges['A1'].value)
        header.append(sheet_ranges['B1'].value)
        print(header)
        passwordList = []
        i = 2
        print(sheet_ranges['A' + str(i)].value)
        while (sheet_ranges['A' + str(i)].value) != None:
            passwordList.append(
                {"username": sheet_ranges['A' + str(i)].value, "password": sheet_ranges['B' + str(i)].value})
            i += 1
        print(passwordList)
        return passwordList


if __name__ == '__main__':
    driv = yahoo()
    driv.setup_driver("C:/Users/vanit/Downloads/chromedriver_win32/chromedriver.exe")
    # driv.login()
    #    driv.go_to_market_data()
    #    driv.read_from_calendar_events()
    #    driv.close()
    cred = driv.get_excel_credentials()
    driv.invalid_login(cred[1])
