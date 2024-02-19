# PawsomePals

## Overview

Welcome to PawsomePals - your ultimate online dog adoption platform. Our mission is to connect loving individuals and families with dogs seeking their forever homes. At PawsomePals, we believe every dog deserves a loving family, and we strive to make the adoption process as smooth and joyful as possible.

## Features
PawsomePals offers a range of features designed to facilitate the dog adoption process:
User:
  * Comprehensive Dog Profiles: Each dog listed on PawsomePals has a detailed profile, including age, breed, health status, and personality traits, to help potential adopters find a perfect match.
  * Adoption Request: User can send choose which dog to adopt and send a request

Admin:
  * Admin Approval: Admin can approve or decline requests from a User
  * Dog Profile Creation: Admin can create a dog profile.
  
## Get Started
### Pre-Requisites
  * Ruby version: 3.2.0
  * Rails version: 7.1.3
  * Database: PostgreSQL
### External gems for delevelopment/test environment
```
  gem 'rspec-rails', '~> 5.0'
  gem 'httparty', '~> 0.19'
  gem 'dotenv-rails'
  gem 'webmock'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'rails-controller-testing'
```
### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/justinFED/dog-adoption.git
2. Navigate to the project directory and run `bundle install` to install all necessary dependencies
3. Start the API server by running `rails server` The API will be available at http://localhost:3000.

### API Endpoints
Web Service: [https://api.thedogapi.com/v1](https://api.thedogapi.com/v1)

Required Headers:
```
headers: 
      x-api-key: key,
      Content-Type: application/json
      Accept:"application/json" 
```
1. List All Breeds
  ```
  URL: /breeds
  Method: GET
  Success Response:
  Code: 200
  Content: JSON array of breeds
  ```
2. Fetch Random Images
  ```
  URL: /images/search?limit=9  
  Method: GET
  Success Response:
  Code: 200
  Content: JSON array of 9 breeds
  ```
3. Fetch details about a specific breed
  ```
  URL: /breeds/#{breed_id}  
  Method: GET
  Success Response:
  Code: 200
  Content: JSON array of specifc breed
  ```
4. Fetch image details
  ```
  URL: /images/#{image_id}  
  Method: GET
  Success Response:
  Code: 200
  Content: JSON array of image of the breed
  ```

## Testing
Run RSpec tests:
```bash
  rspec
```

## Contributions
Contributions are welcome. Please open an issue to discuss your idea or submit a pull request.

## Acknowledgments
[Dog Api](https://thedogapi.com/) data provided by ThatAPICompany.

