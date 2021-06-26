
# Flixster
Shows current movies


# Project 2 - *Aben Flixster*

**Aben Flixster** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **16** hours spent in total

## User Stories

The following **required** functionality is complete:

- [x] User sees an app icon on the home screen and a styled launch screen.
- [x] User can view a list of movies currently playing in theaters from The Movie Database.
- [x] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [x] User sees a loading state while waiting for the movies API.
- [x] User can pull to refresh the movie list.
- [x] User sees an error message when there's a networking error.
- [x] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

The following **optional** features are implemented:

- [x] User can tap a poster in the collection view to see a detail screen of that movie
- [x] User can search for a movie.
- [ ] All images fade in as they are loading.
- [ ] User can view the large movie poster by tapping on a cell.
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [ ] Customize the selection effect of the cell.
- [ ] Customize the navigation bar.
- [ ] Customize the UI.
- [ ] User can view the app on various device sizes and orientations.
- [ ] Run your app on a real device.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1.
2.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![ezgif com-resize](https://user-images.githubusercontent.com/57775399/123496453-ff704000-d5dc-11eb-9d43-906bb425805d.gif)
![ezgif com-resize-3](https://user-images.githubusercontent.com/57775399/123496651-f03dc200-d5dd-11eb-8a05-55ada6456dc3.gif)

![ezgif com-video-to-gif-3](https://user-images.githubusercontent.com/57775399/123496722-4e6aa500-d5de-11eb-89ce-48d30ce0266e.gif)




GIF created with [Kap](https://getkap.co/).

## Notes

NB : my loading state works, my internet connection is fast, so I changed the color of activityIndicator to Red inorder to see that split second loading. And it is visible in the GIF. Watch it attentivly. You can also see it in the GIF where I was not connected to the WiFi- you can see the the middle that the loading was happening until I was connected once again and load the page. 

Describe any challenges encountered while building the app.

brocken outlets. But once I learned how to fix them on the morning All Hands sessions, I was able to fix my own bugs. 

Also, I had problems with changing the backgroung color. I tried different methods incuding adding a picture as a background, but it is not working so far.

I noticed that I usually forget to import, and that is something I had to go back and fix after looking at the error massage. 

In general, this project helped me to develop a good debugging skill. 

Also I had a challenge while working on the searhBar becuase I was loading the movie section from the movie and not from the filterMovies- it took me longer than I should have spent on to figure out my error. 

Also one of the things I noticed in myself was creating a method and forgetting to call it inside the viewDidLoad. But that was an easy catch.



## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
