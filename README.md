# Cura Healthcare Service - Test Automation

Cura Healthcare Service is a web application for practicing test automation using Robot Framework and SeleniumLibrary. This framework supports testing healthcare web features such as login, appointment booking.

## Project Structure

- `Tests/` — Robot Framework test suites
- `Resources/` — Shared resources, page objects, locators, test data, and keywords
- `TestLogs/` — Test execution logs and reports

## Setup

### Prerequisites

Clone the repository:

```powershell
git clone https://github.com/phat4980/cura_healthcare_service.git
```

Install Python 3.12 or later.

Create a virtual environment:

```powershell
pip install virtualenv
python -m virtualenv .env
```

Activate the virtual environment:

On Windows:

```powershell
.env\Scripts\activate
```

On macOS and Linux:

```bash
source .env/bin/activate
```

Install required packages:

```powershell
pip install -r requirements.txt
```

## Usage

### Running Tests

Run a specific test suite:

```powershell
robot -d TestLogs Tests/Login.robot
```

Run all test suites:

```powershell
robot -d TestLogs Tests/
```

## Jenkins & GitHub Webhook Setup

To automate test runs on code changes, set up Jenkins with ngrok and configure GitHub webhooks:

### Jenkins with ngrok

1. Download and install [ngrok](https://ngrok.com/download).
2. Start Jenkins locally (default: http://localhost:8080).
3. Run ngrok to expose Jenkins:

   ```powershell
   ngrok http 8080
   ```

   This will provide a public URL forwarding to your local Jenkins instance.
4. Use the public ngrok URL for webhook integrations or remote access to Jenkins.

### GitHub Webhook Setup

1. Go to your GitHub repository > Settings > Webhooks.
2. Click "Add webhook".
3. In the "Payload URL" field, enter your public ngrok URL followed by `/github-webhook/` (e.g., `https://xxxx.ngrok.io/github-webhook/`).
4. Choose Push events will trigger the webhook.
5. Save the webhook.

### Jenkins Job Configuration

1. Download and install [Jenkins](https://www.jenkins.io/download/) and Robot Framework plugin.
2. In Jenkins, create a new Freestyle job.
3. In "Build Triggers", check "GitHub hook trigger for GITScm polling".
4. Configure your build steps to run Robot Framework tests.
#### Example of 1 report in Jenkins
<img width="1412" height="865" alt="image" src="https://github.com/user-attachments/assets/73c6bcc6-9c94-44b0-b843-ca938bb2c73c" />
### Additional informaion
[Jenkins setup](https://www.jenkins.io/doc/) : Access this tutorial document for more detailed setups

Note: You may need to update the variables in [RunConfig.resource](RunConfig.resource) to match your local environment.
Typical fields to check:
- chrome_path
- chrome_debug_port
- chrome_test_profile_folder

--------------------------

This project is for learning and demonstration purposes.
