*** Settings ***
Library  SeleniumLibrary
Library           DateTime
Suite Setup     Open browser  https://todo-list-login.firebaseapp.com/#!/  chrome
Suite Teardown  Close browser
*** Variables ***
${CurrentTitle}
${LoginLink}   https://todo-list-login.firebaseapp.com/#!/
${GitHubSignIn}   //*[contains(@class,'btn btn-social btn-github') and contains(@ng-click,'login.loginWithGithub()')]
${TextInput}   //input[@type='text']
${PasswordInput}   //input[@type='password']
${SignInButton}   //input[@type='submit']
${LogoutButton}   Sign out
${AuthorizeButton}   //button[@id='js-oauth-authorize-btn']
${ListInput}   //input[@ng-model='home.list']
${AddListButton}  //button[@ng-click='home.list && home.add()']
${DeleteVariable5}  //body/ng-view[1]/div[1]/div[3]/div[1]/ul[1]/li[5]/div[1]/div[2]/button[1]
#Editable Variables

${Username}   
${Password}   
${Variable1}  a
${Variable2}  b
${Variable3}  c
${Variable4}  d
${Variable5}  e
${Variable6}  f
${Variable7}  g
${Variable8}  h
${Variable9}  i
${Variable10}  j
*** Test Cases ***
Login Test
  [documentation]  US1 - Test login
  [tags]  login, verification, logout
  Login
  Sign In
#  Allow Access to Github
Add Items to List Test
  [documentation]  US2 - Adding Items to List
  [tags]  input, logout
  Add Text to List
  Logout
Delete Items from List Test
  [documentation]  US3 - Deleting Items from List
  [tags]  login, delete list, logout
  Login
  Delete List
  Logout
*** Keywords ***
Login
  Go To   ${LoginLink}
  Click Element   ${GitHubSignIn}
  Switch Window   new

Logout
  Switch Window   main
  Click Button   ${LogoutButton}
  Builtin.Sleep   3s

Sign In
  Wait Until Element Is Visible   ${TextInput}
  Wait Until Element Is Visible   ${PasswordInput}
  Input Text   ${TextInput}   ${Username}
  Input Password   ${PasswordInput}   ${Password}
  Click Element   ${SignInButton}
  Builtin.Sleep   5s

Allow Access to Github
  Wait Until Page Contains  Reauthorization required
  Wait Until Page Contains  Authorize prateek3255
  BuiltIn.Sleep   3s
  Click Button   Authorize prateek3255
  BuiltIn.Sleep   3s

Add Text to List
  Switch Window  main
  BuiltIn.Sleep   2s
  Wait Until Element Is Visible   ${TextInput}
  Input Text   ${ListInput}   ${Variable1}
  Click Element   ${AddListButton}
  Wait Until Page Contains   ${Variable1} List
  BuiltIn.Sleep   1s

  Input Text   ${ListInput}   ${Variable2}
  Click Element   ${AddListButton}
  Wait Until Page Contains   ${Variable2} List
  BuiltIn.Sleep   1s

  Input Text   ${ListInput}   ${Variable3}
  Click Element   ${AddListButton}
  Wait Until Page Contains   ${Variable3} List
  BuiltIn.Sleep   1s

  Input Text   ${ListInput}   ${Variable4}
  Click Element   ${AddListButton}
  Wait Until Page Contains   ${Variable4} List
  BuiltIn.Sleep   1s

  Input Text   ${ListInput}   ${Variable5}
  Click Element   ${AddListButton}
  Wait Until Page Contains   ${Variable5} List
  BuiltIn.Sleep   1s

  Input Text   ${ListInput}   ${Variable6}
  Click Element   ${AddListButton}
  Wait Until Page Contains   ${Variable6} List
  BuiltIn.Sleep   1s

  Input Text   ${ListInput}   ${Variable7}
  Click Element   ${AddListButton}
  Wait Until Page Contains   ${Variable7} List
  BuiltIn.Sleep   1s

  Input Text   ${ListInput}   ${Variable8}
  Click Element   ${AddListButton}
  Wait Until Page Contains   ${Variable8} List
  BuiltIn.Sleep   1s

  Input Text   ${ListInput}   ${Variable9}
  Click Element   ${AddListButton}
  Wait Until Page Contains   ${Variable9} List
  BuiltIn.Sleep   1s

  Input Text   ${ListInput}   ${Variable10}
  Click Element   ${AddListButton}
  Wait Until Page Contains   ${Variable10} List
  BuiltIn.Sleep   1s

Delete List
  Switch Window   main
  BuiltIn.Sleep   5s
  Click Button   ${DeleteVariable5}
  BuiltIn.Sleep   1s
  Click Button   ${DeleteVariable5}
  BuiltIn.Sleep   1s
  Click Button   ${DeleteVariable5}
  BuiltIn.Sleep   1s
  Click Button   ${DeleteVariable5}
  BuiltIn.Sleep   1s
  Click Button   ${DeleteVariable5}
  BuiltIn.Sleep   1s
  Click Button   ${DeleteVariable5}
  BuiltIn.Sleep   1s
