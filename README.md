WEB SCAPPER PROJECT WRITTEN WITH PYTHON PROGRAMMING LANGUAGE

Install Python (latest version) https://www.python.org/downloads/

Install Code Editor: Recommended (VS Code) https://code.visualstudio.com/download

Access the Extensions Icon on VS Code and install: Jupyter Extensions, Python Extension

Open the program codes folder and access the scrapper.ipynb file and click Run All

Each cell will carry out its functionality and upload the results to the JSON files

The scrapper is a hybrid scrapper using both HTML structure scrapping and API endpoint scrapping 

The xpath was used to scrape the links of all the products available on the store 
the script is shown below:
![Screenshot (108)](https://user-images.githubusercontent.com/99039727/194977210-db9de647-ffcc-45bc-af97-4771ca47c3c4.png)

Then the product id was extracted from the product link and passed into the API scrapping script to scrape information about each product:
![Screenshot (109)](https://user-images.githubusercontent.com/99039727/194977306-f091a209-413f-4b11-8535-34647ba805b1.png)

The raw data scrapped is a total of 9812 products and is stored in Karlna.json:
![Screenshot (110)](https://user-images.githubusercontent.com/99039727/194977493-64cd7685-7e7f-4e3e-a5e2-3e54df69d225.png)

There after we need to filter and extract the specified data by client so we built a script to extratc and arrange data the way the client excpects it and its stored in KarlnaData.json:
Script for filtering data:
![Screenshot (111)](https://user-images.githubusercontent.com/99039727/194977736-dce274c0-c686-4f06-95b9-db29d586d296.png)

And the filtered data is stored in KarlnaData.json:
![Screenshot (112)](https://user-images.githubusercontent.com/99039727/194977858-25077ae2-581a-411c-bd01-538c24ddde0c.png)


UPDATE PROGRESS: 
Filtering progress is at 60% done. Data to be added to the filtered data is List of stores and Merchcant time stamp 

CHALLENGES:
Script has not been able to scrape above 9812 products but i will keep trying to see how i can get it to srape all complet 14000 + products.


