## Installation

### Prerequisites

- PostgreSQL
- Ruby 3.1.2
- Ruby on Rails 7.1.3.4

### Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Brissux/rememeber
   cd videoclub
   ```

2. **Install Ruby and JavaScript dependencies**:
   ```bash
   bundle install
   yarn install
   ```

3. **Setup the database**:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Obtain API keys for Cloudinary** and set them as environment variables or in your credentials file.

### Running Locally

To start the Rails server, run:
```bash
rails s
```
Navigate to `http://localhost:3000` to see the application in action.
