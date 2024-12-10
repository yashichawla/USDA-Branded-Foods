# DS 5110 Introduction to Data Management and Processing

This project explores how food data from USDA FoodData Central can be organized and analyzed to provide meaningful insights. The focus is on building a system that simplifies the process of categorizing food products, uncovering trends, and improving data accessibility for various stakeholders. By addressing challenges in data organization and processing, the project aims to support better decision-making in areas like inventory management, nutrition planning, and personalized recommendations.

# Exploratory Data Analysis (EDA)

## Data Procurement

To obtain data from the Branded Food Products Dataset provided by the USDA, visit the USDA FoodData Central website [https://fdc.nal.usda.gov]. Navigate to the "Data Download" section, where you can access the dataset in various formats. Select the "Branded Food Products Dataset" and download the file.

## Data Cleaning
- Navigate to the `EDA/clean_data.ipynb` notebook.
- Run the notebook to preprocess and clean the USDA dataset.

## Data Analysis
- Explore the cleaned data using the following notebooks:
  - `EDA/Data_Analysis_1.ipynb`
  - `EDA/Data_Analysis_2.ipynb`
  - `EDA/Data_Analysis_3.ipynb`
- Visualize key insights using the images in the `EDA/visualization` folder.

---

# Data Engineering

## Database Setup
- Execute the SQL scripts in the `SQL` folder to create the database schema and tables.
- Refer to the ER diagram in the `Schema` folder for a visual representation.

## Data Loading
### Import the CSV File into pgAdmin

1. **Locate the Table**:  
   - In pgAdmin, find the table you want to import data into.  
   - Right-click on the table and choose **"Import/Export"**.

2. **Set Import Options**:  
   - **Filename**: Browse and select your CSV file.  
   - **Format**: Choose `CSV`.  
   - **Header**: Check this box if your CSV has column headers.  
   - **Delimiter**: Set the delimiter (e.g., `,` for commas).  

3. **Start Import**:  
   - Click **OK** to start the import.

---

# User Interface (GUI)

## Query Execution
- Navigate to the `GUI` folder.
- Execute SQL queries in 'GUI.ipynb' or explore pre-executed queries in the `output` folder.

  ![image](https://github.com/user-attachments/assets/d623a407-bac9-4b2b-9997-db849a8528c7)

---

# Machine Learning

## Logistic Regression
- Open the `ML/IDMP_ML_Logistic Regression.ipynb` notebook.
- Train and evaluate a logistic regression model to understand its predictive capability for food categorization.

## Random Forest
- Open the `ML/IDMP_ML_Random_Forest.ipynb` notebook.
- Train and evaluate a random forest model to understand its predictive capability for food categorization.


