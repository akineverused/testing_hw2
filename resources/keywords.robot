*** Settings ***
Library     SeleniumLibrary
Resource    variables.robot

*** Keywords ***
Open Browser To SauceDemo
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

Login
    Input Text    xpath=//input[@id="user-name"]    ${USERNAME}
    Input Text    xpath=//input[@id="password"]    ${PASSWORD}
    Click Element   xpath=//input[@id="login-button"]

Close Browser
    Close All Browsers
    
Logout
    Click Button    xpath=//button[@id="react-burger-menu-btn"]
    Sleep    1s
    Click Element   xpath=//a[text()="Logout"]

Check And Act
    [Arguments]    @{products}
    
    ${cart_badge_present}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//span[@data-test="shopping-cart-badge"]
    ${ITEM_COUNT}=    Set Variable    0
    IF    ${cart_badge_present}
        ${ITEM_COUNT}=    Get Text    xpath=//span[@data-test="shopping-cart-badge"]
    END

    ${ITEM_COUNT}=    Convert To Integer    ${ITEM_COUNT}
    ${PLANNED_COUNT}=    Get Length    ${products}

    IF    ${ITEM_COUNT} == ${PLANNED_COUNT}
        Buy Products
    ELSE
        Clear Cart
    END

Clear Cart
    Click Element    id=shopping_cart_container
    ${remove_buttons}=    Get WebElements    xpath=//button[contains(@id, "remove")]
    FOR    ${btn}    IN    @{remove_buttons}
        Click Element    ${btn}
    END
    Log    Cart cleared successfully
    Click Element    id=continue-shopping

Add Products To Cart
    [Arguments]    @{products}
    FOR    ${product}    IN    @{products}
        ${product_present}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[text()="${product}"]
        IF    ${product_present}
            Click Element    xpath=//div[text()="${product}"]
            Click Element    id=add-to-cart
            Click Element    id=back-to-products
        END
    END
    Log    Added all selected products to cart

Buy Products
    Click Element    id=shopping_cart_container
    Click Element    id=checkout
    Input Text    id=first-name    ${FIRST_NAME}
    Input Text    id=last-name    ${LAST_NAME}
    Input Text    id=postal-code    ${CODE}
    Click Element    id=continue
    Click Element    id=finish
    Click Element    id=back-to-products

