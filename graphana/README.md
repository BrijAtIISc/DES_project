# Steps to install and setup graphana dashboard
Grafana Setup on macOS

Prerequisites

Before proceeding, ensure you have the following installed on your macOS:

Homebrew (a package manager for macOS)
Grafana (for monitoring and visualizing data)
1. Install Homebrew
If you don’t already have Homebrew installed on your macOS, you can install it by running the following command in your terminal:

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
To check if Homebrew is installed, run:

brew --version
2. Install Grafana Using Homebrew
Once Homebrew is installed, you can easily install Grafana with the following command:

brew install grafana
3. Start Grafana Server
After the installation is complete, you can start the Grafana server with:

brew services start grafana
This command will start Grafana as a background service that will automatically launch on system boot.

4. Verify Grafana is Running
To verify that Grafana is running, open your web browser and go to:

http://localhost:3000
The default login credentials are:

Username: admin
Password: admin
You will be prompted to change the password after logging in for the first time.

5. Stop Grafana Server
If you want to stop Grafana at any point, use the following command:

brew services stop grafana
6. Configure Grafana (Optional)
To configure Grafana, you can edit the configuration file located at /usr/local/etc/grafana/grafana.ini. Use a text editor to modify the settings to your preference.

nano /usr/local/etc/grafana/grafana.ini
Make any necessary changes, then save and exit.

7. Install and Set Up Data Sources
After logging into Grafana, you can add data sources (such as Prometheus, MySQL, or Elasticsearch) to start visualizing your data.

Go to the Grafana dashboard.
Click on the gear icon ⚙️ on the left sidebar (Configuration).
Select Data Sources.
Click Add data source, select your data source type (e.g., Prometheus), and configure the connection.
8. Create Your First Dashboard
To create your first dashboard:

Click on the "+" icon on the left sidebar and select Dashboard.
Add panels to your dashboard by clicking Add new panel.
Configure the data source and metrics you want to visualize.
9. Install Grafana Plugins (Optional)
Grafana supports various plugins to extend its functionality. To install plugins:

Go to the Grafana dashboard.
Click on the gear icon ⚙️ and select Plugins.
Search for the plugin you want to install, then click Install.
For example, you can install the Clock plugin to display the current time in your dashboard.

grafana-cli plugins install <plugin-name>
10. Access Grafana Logs
If you encounter issues, you can view Grafana logs for troubleshooting:

tail -f /usr/local/var/log/grafana/grafana.log
Troubleshooting

Grafana Not Starting?
If you encounter issues with Grafana not starting, you can check the status of the service using:

brew services list
If Grafana is not running, you can restart the service with:

brew services restart grafana
Permissions Issues
If you face permissions-related errors, ensure that the user running Grafana has the appropriate access to the necessary directories and files.

Additional Resources

Grafana Documentation
Grafana GitHub Repository
Grafana Community


## For GUI related credentials:
Link: http://localhost:3000
username: admin
password: DES_project

