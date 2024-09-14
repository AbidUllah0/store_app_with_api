# store_app_api

STORE APP

## Getting Started

**Overview :**
The Store App is a multi-screen e-commerce Flutter application that allows users to browse and search for products, view product details, and navigate through various categories. This project showcases advanced Flutter concepts, including state management, API integration, and a polished UI/UX design.

**Features :**
Product Display and Search: View and search through a list of products fetched from a RESTful API.
Categories and User Navigation: Navigate through categories and user sections with smooth animations.
Advanced Animations: Smooth transitions between screens using animations and carousel for promotional content.
State Management: Uses Provider for managing state across the app.
API Integration: Fetches data in real-time from an external API to display products.

**State Management**
The app uses the Provider package for state management:

**ProductProvider:** Manages the state for product data. It fetches the product list from an API and provides it to the widgets that need it.

**How State Management is Used :**
Fetching Data: ProductProvider fetches product data using an asynchronous method (getAllProduct) and provides it to the UI using FutureBuilder.
Updating UI: Uses Consumer to rebuild parts of the UI when the product data changes.

**API Integration :**
RESTful API: The app integrates with a RESTful API to fetch product details.
API Calls: Implemented in api_service.dart where HTTP requests are made to retrieve data.
Data Model: The ProductModel class defines the structure of the product data received from the API.

**Responsive Design**
Uses MediaQuery to make the UI elements responsive.
Employs GridView.builder to adapt the product list layout based on screen size.
The carousel (Swiper widget) adjusts its height dynamically according to the screen dimensions.

**Advanced UI/UX:**
Animations: The app uses smooth page transitions with the PageTransition package to enhance user experience.
Custom Widgets: Custom components like FeedsWidget, SaleCarousel, and CustomTextField ensure a consistent UI across the app.
Search Functionality: Allows users to filter products by title dynamically.

**How to Run the App** :
Pre-requisites: Ensure Flutter is installed and set up on your system.
Run the App:
Connect an emulator or a physical device.
Run flutter run in the project directory.
Navigate the App:
Use the search bar on the home screen to find products.
Tap on categories or products to view more details.
Explore user-related functionalities from the user screen.

**Design Decisions :**
State Management with Provider: Chosen for its simplicity and efficiency in managing app-wide state in a small to medium-sized application.
Swiper for Carousel: Provides an easy-to-use and visually appealing carousel for displaying promotional content.
Separation of Concerns: The app follows the MVC pattern where the model (ProductModel), view (UI components), and controller (providers and services) are separated for better maintainability.
Custom Transitions: Used PageTransition to enhance the navigation experience between different screens with smooth animations.



