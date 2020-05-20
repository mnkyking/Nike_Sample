# Nike_Sample


Nike Coding Sample:

Create a sample app for review. Create a sample iPhone app that displays the `top 100 albums` across `all genres` using Apple’s RSS generator found here: https://rss.itunes.apple.com/en-us.
`https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json`

The app should
·       NOT use storyboards or nibs
·       Use Auto Layout
·       NOT have force unwrap statements
·       NOT use any third-party libraries

`MVVM`

Provide your application via a Git link.

Expected Behavior

`Launch View`
On launch, the user should see a UITableView showing one album per cell. 
Each cell should display the name of the album, the artist, and the album art (thumbnail image). 
Tapping on a cell should `push` another view controller onto the `navigation stack`

`Details View`
where we see a larger image at the top of the screen and the same information that was shown on the `cel`l, plus `genre`, `release date`, and `copyright info` below the `image`. 
A button should also be included on this second view that when tapped fast app switches to the album page in the iTunes store. 
The `button` should be `centered horizontally` and `pinned 20` points from the `bottom` of the view and `20` points from the `leading and trailing` edges of the view. Unlike the first one, this “detail” view controller should `NOT use a UITableView` for layout. 

 

Paginated? 10? 20? Infinite Scrolling?
Limit on RSS Feed Generator? 10? 100?
Portrait/Landscape?
MVVM?
