*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/keywords.robot

*** Test Cases ***
Buy Selected Products
    Open Browser To SauceDemo
    Login
    Add Products To Cart    @{PRODUCTS}
    Check And Act    @{PRODUCTS}
    Sleep    1s
    Close Browser