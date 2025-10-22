*** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***
Login and Logout on SauceDemo
    Open Browser To SauceDemo
    Login
    Logout
    Close Browser