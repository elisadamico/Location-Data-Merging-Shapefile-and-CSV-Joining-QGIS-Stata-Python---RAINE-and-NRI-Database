# RAINE & NRI Spatial Join (with no mappable location attributes in the RAINE CSV)

###Import initial shapefile###
from qgis.core import QgsVectorLayer

# Path to the shapefile (.shp) file
shapefile_path = '/pathtoshapefile.shp'
### e.g. shapefile_path = 'C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\FEMA Data\NRI_Shapefile_CensusTracts\NRI_Shapefile_CensusTracts.shp'

# Create a vector layer object
layer = QgsVectorLayer(shapefile_path, 'layer_name', 'ogr')
### e.g. layer = QgsVectorLayer(shapefile_path, 'NRI Data', 'ogr')

# Check if the layer is valid
if layer.isValid():
    # Add the layer to the map canvas
    QgsProject.instance().addMapLayer(layer)
    print('Shapefile imported successfully.')
else:
    print('Invalid shapefile.')

###Import CSV that lacks location data###
uri = /pathtocsv.csv?delimiter=,'
### e.g. uri = 'file:///Users/ep9k/Desktop/SandraMonson/CountByZip.csv?delimiter=,'
csv_file = QgsVectorLayer(uri, 'RAINE', 'delimitedtext')
QgsProject.instance().addMapLayer(csv_file)

# Join by County – Join Attributes by Field Value (One to many join type)
processing.run("native:joinattributestable", {'INPUT':'C:\\Users\\elisa\\OneDrive\\Desktop\\Climate Vulnerability Data\\FEMA Data\\NRI_Shapefile_CensusTracts\\NRI_Shapefile_CensusTracts.shp','FIELD':'COUNTY','INPUT_2':'delimitedtext://file:///C:/Users/elisa/OneDrive/Desktop/Climate%20Vulnerability%20Data/RAINE.csv?type=csv&maxFields=10000&detectTypes=yes&geomType=none&subsetIndex=no&watchFile=no','FIELD_2':'COUNTY','FIELDS_TO_COPY':[],'METHOD':0,'DISCARD_NONMATCHING':False,'PREFIX':'','OUTPUT':'TEMPORARY_OUTPUT'})
# Rename Joined Layer to County Joined Layer & Export as CSV
# Join by State – Join Attributes by Field Value (One to many join type)
# * I do this because some of my data in the RAINE Database does not have a county associated, just a state
processing.run("native:joinattributestable", {'INPUT':'C:\\Users\\elisa\\OneDrive\\Desktop\\Climate Vulnerability Data\\FEMA Data\\NRI_Shapefile_CensusTracts\\NRI_Shapefile_CensusTracts.shp','FIELD':'STATEABBRV','INPUT_2':'delimitedtext://file:///C:/Users/elisa/OneDrive/Desktop/Climate%20Vulnerability%20Data/RAINE.csv?type=csv&maxFields=10000&detectTypes=yes&geomType=none&subsetIndex=no&watchFile=no','FIELD_2':'STATEABBRV','FIELDS_TO_COPY':[],'METHOD':0,'DISCARD_NONMATCHING':False,'PREFIX':'','OUTPUT':'TEMPORARY_OUTPUT'})
# Rename Joined Layer to State Joined Layer & Export as CSV

### Now, move on to STATA Merge
