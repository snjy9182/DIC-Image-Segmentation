//Enter in filepath of .tif image
run("/Users/sunjayyoo/plotTrack Image Mask/Images_Anand/Substack (12036-12036).tif");

run("Morphological Segmentation");
wait(1000);
call("inra.ijpb.plugins.MorphologicalSegmentation.setInputImageType", "object");

//Run watershed segmentation 
//Change tolerance level from default of tolerance=6200 to achieve appropriate results
//Lower numbers mean more segmentation and vice versa.
call("inra.ijpb.plugins.MorphologicalSegmentation.segment", "tolerance=6200", "calculateDams=true", "connectivity=26");

//Option 1: Segmentation with just watershed lines
call("inra.ijpb.plugins.MorphologicalSegmentation.setDisplayFormat", "Watershed lines");

//Option 2: Segmentation with the watershed lines superimposed over original image
//call("inra.ijpb.plugins.MorphologicalSegmentation.setDisplayFormat", "Overlaid dams");

//Option 3: Segmentation image with colored basins
//call("inra.ijpb.plugins.MorphologicalSegmentation.setDisplayFormat", "Catchment basins");

//Option 4: Segmentation image with colored basins superimposed over original image
//call("inra.ijpb.plugins.MorphologicalSegmentation.setDisplayFormat", "Overlaid basins");

//Create segmented image from selected option
call("inra.ijpb.plugins.MorphologicalSegmentation.createResultImage");
