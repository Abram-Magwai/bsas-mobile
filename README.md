# FNB Bank Statement Summarizer App

The FNB Bank Statement Summarizer App is a Flutter application that connects to the FNB Bank Statement Summarizer API to provide summarized views of your bank statements. With this app, you can conveniently access and analyze your FNB bank transactions on your mobile device.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The FNB Bank Statement Summarizer App simplifies the process of reviewing and understanding your FNB bank statements. It connects to the FNB Bank Statement Summarizer API to fetch summarized transaction data, enabling you to conveniently view transaction summaries, categorize expenses, and gain insights into your financial activities.

## Features

- **Statement Summaries**: View summarized transaction information, including totals, categories, and balances.
- **Transaction Filtering**: Filter transactions based on date ranges or specific categories for focused analysis.
- **Expense Categorization**: Categorize transactions manually or automatically to better track and analyze your spending.
- **Data Visualization**: Visualize transaction data using charts and graphs to understand patterns and trends.
- **Secure Access**: Authenticate with your FNB bank account credentials or use secure token-based authentication for API access.

## Installation

1. Ensure you have [Flutter](https://flutter.dev) installed on your system.
2. Clone the repository:

   ```shell
   git clone https://github.com/your-username/fnb-bank-statement-app.git
   ```

3. Navigate to the project directory:

   ```shell
   cd fnb-bank-statement-app
   ```

4. Fetch the project dependencies:

   ```shell
   flutter pub get
   ```

5. Connect the app to the API:

   - Open the `lib/api/api_service.dart` file.
   - Replace the `API_BASE_URL` constant with the URL of your deployed FNB Bank Statement Summarizer API.

6. Run the app:

   ```shell
   flutter run
   ```

7. The app should now be running on your connected device or simulator.

## Usage

1. Launch the FNB Bank Statement Summarizer App on your device.
2. The app will connect to the API and fetch the summarized transaction data.
3. View your transaction summaries, categorized expenses, and account balances.
4. Use the filtering and visualization features to gain insights into your financial activities.
5. Customize categories, add manual tags, or perform other actions to enhance your experience.
- NB: some features will be implemented as time goes on.

For more information on using the app, refer to the [User Guide](./docs/user-guide.md).

## Contributing

Contributions are welcome! If you would like to contribute to the FNB Bank Statement Summarizer App, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature/bug fix.
3. Commit your changes and push the branch to your forked repository.
4. Submit a pull request describing your changes.
