*** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***
Clear Cart If Not Enough Products
    Open Browser To SauceDemo
    Login
    Add Products To Cart    @{PRODUCTS_2}
    Check And Act    @{PRODUCTS_2}
    Sleep    1s
    Close Browser