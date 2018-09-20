# SpyApp

**SpyApp** is a app can be encrypt and decrypt 4 type of ciphers. 
Include CeaserCipher, AlphanumericCipher, ROT13Cipher, TripleCipher.

## Requirement

1) Extend the Cipher protocol to include a decrypt method.
- [x]  The decrypt method should take in an encrypted string and a secret and should
return a plaintext string.
- [x] Once you update the Cipher protocol you will have to update the CesarCipher
with a decrypt method.

2) Create a new cipher named AlphanumericCesarCipher that implements the Cipher protocol. Add the cipher to the CipherFactory.
Your cipher should:
- [x] Only take alphanumeric input. (characters A-Z, a-z and numbers 0-9)
- [x] The output should only include characters A-Z or 0-9. Lower-case characters should be converted to upper-case before they are encrypted.
- [x] The mapping should be cyclical in either direction.
Example: Shifting by 1:
Z maps to 0, 9 maps to A Shifting by -1:
A maps to 9, 0 maps to Z

3) Create at least two more cyphers for the spy app. Add all Ciphers you create to the CipherFactory and add buttons that allow the user to switch to all implemented ciphers.
- [x] Comment your cipher. What characters are valid input, what is the output of your
cipher.
- [x] The decrypt method should reverse what the encrypt method does.

4) Create layout constraints for all new buttons.
- [x] Make sure your app looks good on devices with different resolutions and in both
horizontal and vertical orientation.
- [x] Play around a little with interface builder and improve the look of the app.

5) No input should crash the app. Unwrap all optionals the way we discussed in class (we will discuss optionals in week 2) and display an appropriate error method.

6) Write unit tests for all model methods you add. (We will discuss unit tests in week 2)
- [x] Tests for each cipher you create should be in their own file.
- [x] Try to test for all edge cases your cipher introduces.
- [x] Come up with meaningful names for your test classes and test cases. Well written
tests serve as documentation of your code!

## Video Walkthrough

Here's a walkthrough of implemented requirement:

<img src='https://i.imgur.com/2FXxbnu.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## License

    Copyright [2018] [Jangey]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
