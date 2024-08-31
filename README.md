# Delivery Me

## Important Note Before Running

The given endpoint is not working properly. Therefore, I have used npoint.io to create a JSON bin. 

If the configured JSON bin endpoint is not working, it's probably due to expiration. Please follow the steps below to set up a working endpoint for testing.

## Steps to Create a JSON Bin and Update Endpoint

1. **Create a JSON Bin**:
   - Visit [npoint.io](https://www.npoint.io/).
   - Create a new JSON bin by following the instructions on the website.
   - You can find dummy data in `my_deliveries.fixture.json` inside `Test Target`. Paste the dummy data into the JSON bin to simulate the response. 
   - Save the JSON bin and copy the provided endpoint URL.

2. **Update the Endpoint Path**:
   - Open the `DeliveriesRequest` file in project.
   - Update the endpoint path with the URL of the JSON bin you created.

By following these steps, you should be able to run the project with functional data and endpoints.

## Other Prerequisites
- Minimum Deployment Target: iOS 16.0
- SDWebImage and SDWebImageSwiftUI SPM dependencies

## Features
- **Onboarding Screens**: Initial setup and introduction to the app.
- **My Deliveries**: Displays all the deliveries.
- **Delivery Details View**: Shows delivery information and provides the ability to favorite/unfavorite a delivery.

## Project Structure
- **Models**: Contains data models used throughout the app.
- **Screens**: Contains the UI screens of the app.
- **ViewModels**: Contains the view models that manage the data for the screens.
- **NetworkStore**: A generic network request layer for fetching data from a remote source.
- **Data Repository**: Contains three components:
     - **Data Store**: An abstraction layer for performing data fetching and updating.
     - **Remote Repository**: Responsible for fetching data from remote sources.
     - **Cache Repository**: Manages storing and fetching data using Core Data.
- **App**: Contains app-related files and configuration.
- **Extensions**: Additional extensions to enhance functionality.
- **Utils**: Utility methods and helper functions.
- **DeliverMeTests**: Contains unit tests for the project.

