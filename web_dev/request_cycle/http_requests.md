**COMMON HTTP CODES**

2xx Successes, generally
200 Request succeeded

3xx Redirection, generally
301 Moved permanently   - should relink to new URI
302 found               - temporary relocation
304 Not modified        - ??? (explanation doesn't make sense yet)  
307 Temp redirect       - like 302, temporarily relocated

4xx Failures, generally
400 Bad request     - wrong syntax
401 Unauthorized    - needs authentication to proceed
403 Forbidden       - server will not fulfill
404 Not found       - no such location exists


**GET vs POST**

GET:
- when we want to view something (retrieve data)
- not for operations with side effects
- included in the URI(URL)
- may have unintended effect with AJAX

POST:
- when we want to change something (insert/update data)
- used when security of data is needed

**COOKIE**

A unique set of data stored in a user's browser that saves information about the user's activities for tracking purposes, or to allow the site to provide necessary functionality -- such as in a shopping cart or other saved state.

