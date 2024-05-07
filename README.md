# Simple-Video-Feed-iOS-App

Overview
This iOS application follows the VIPER architecture pattern to maintain a structured and modular codebase. The app displays a list of videos fetched from an API and allows users to view video details and user profiles.

Features
Display a list of videos in a collection view.
Each cell in the collection view displays a thumbnail image, username, and like count.
Videos play automatically when the player is ready.
Pull to refresh list of posts. 
Tapping on a cell opens a detailed view controller with the video and user information.
Navigate to the user profile view controller to view the user's profile image, name, and list of posts.


Architecture
The app is built using the VIPER architecture pattern, which stands for:

View: User interface components

Interactor: Business logic and data management

Presenter: Mediator between view and interactor, responsible for presentation logic

Entity: Data models

Router: Navigation logic (Please note that for now i have not created a Router for simplicity)

The VIPER architecture ensures separation of concerns and makes the app modular and scalable.

Mock Data
Mock data is provided in a simple JSON file. Additionally, a local server is started using an AJAX request from an index.html file to serve the mock data. This setup enables testing and development with realistic data without relying on external APIs.

Folder Structure
The project folder structure follows a modular approach, with separate folders for each VIPER module:

Modules: Contains separate folders for each feature module (e.g., Main, Detail, UserProfile).
Common: Shared components and utilities used across modules.
Networking: Network layer implementation for API communication.
Resources: Assets, localization files, and other resources.
Installation
Clone the repository from [[GitHub Repo URL]](https://github.com/akhil1907/Simple-Video-Feed-iOS-App).
Open the project in Xcode.
Build and run the app on a simulator or device.

Dependencies
The app uses the following dependencies:
[Dependency 1]: SDWebImage 
