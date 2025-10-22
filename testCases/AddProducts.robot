*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/keywords.robot

*** Test Cases ***
Add Selected Products To Cart
    Open Browser To SauceDemo
    Login
    Add Products To Cart    @{PRODUCTS}
    Logout
    Close Browser