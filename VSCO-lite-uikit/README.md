# Quinn Notes: 

## Time Spent
- 2-3 hours

## Challenges: 
- Did some research and logging to nail down my understanding of the Flickr API response format
- Wanted to get some sort of nicer waterfall style layout for the results since they come in differing sizes. Would use more time for this

## Trade-offs:
- Would comment more thuroughly with more time and if other engineers were going to use the code
- Creating a FlickrAPI in each image cell for simplicity here. In future would make a shared instance in case we need to start expanding FlickrAPI capability so this doesn't sneak up on us
- fetchImageData func in FlickrAPI could be part of a more general Image Data fetching file. In here for simplicity

## With More Time:
- In addition to the waterfall layout I would also add nicer loading states to the results collection view and result cells
- I would do more research on other useful information I could display along with the images. I bring the title in but decided not to display them because they didn't seem useful in most cases and often looked haphazard
- I would create a cacheing system for the image results. Includie a clearing function when it reached a certain size
- I would store the currently displayed state of results and search when the user exits the app to display them as quickly as possible when launching the app later
- Create some sort of action (download, post on twitter, etc.) for users to do with the image results
