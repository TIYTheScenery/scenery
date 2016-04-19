# The Scenery

The Scenery aims to support the performing arts industry by providing resources for patrons of the arts and artists alike.. You can find out about your local performance scene whether you’re a patron looking for fresh entertainment, an actor looking for an audition, or a company looking to promote their work.

The Scenery utilizes some of the latest web technologies to bring live performance to you! Built with HTML5 and CSS3, using an Angular.js and Jquery front end supported by Ruby on Rails and PostgreSQL database serving up our API. The-Scenery.com is served to all your devices by Heroku and Firebase servers wrapped in one domain with Amazon Web Services providing additional file storage for the images.

The Scenery allows everyone to have the performing arts at their fingertips. Bertolt Brecht once said, “The play isn’t finished until people are in the streets talking about it.” The street corner is now digital, and its bustling live at www.the-scenery.com.

## The Database
  All of the info is stored with Ruby on Rails in our PostgreSQL database which is best represented by this [ERD chart](http://i.imgur.com/euAnYR0.jpg).

## What can it do?
  The application supplies a Rails database Api to support our front end Angular site.  It has a number of different subsets of use:

  * Search Feature
    * Keyword Search: Entering any word or phrase in the search text field will run through all Companies,
    Performances, and Professionals in the database to return any that have the word or phrase in their name,
    title, or description.
    * Advanced Search options allow:
      * Search by Genre (Theatre, Improve, Dance, or Film)
      * Search by Type (Professionals, Companies, or Performances.)
      * Search by City, State, or Zip Code
  * Sign Up
    * User is given the option to be a Professional on the site when they sign up.
      * Professionals have the ability to create Companies, Performances, and Opportunities. They can also leave Reviews.
      * Non Professional Users can search all information in the database and leave Reviews on the Companies and Performances as well.
  * Profile Page
    * Every user can upload a profile Picture, edit their information, and add a description to their page.  
    * All of the Reviews they have left on the site will populate their page.
    * Professionals can have the above features as well as:
      * Social Media Links.
      * Title to denote their skill set.
      * All of the Companies they have created listed.
  * Company Page
    * Can add a background image as well as a profile picture for the company.
    * It lists the reviews of your Company.
    * It lists your upcoming performances as well as your past performances.
      * Clicking on the performance will bring you to that Performance's show page.
    * Displays social media links, website link, location, and Company description.
    * Displays the Opportunities you have created.
      * Opportunities can be audition notices, job postings, or anything other need for outside collaborators your Company needs.
  * Performance Page
    * Displays your Company's name and the Performance name.
    * Has the Performance's description, ticketing link, trailer link, tags to refine the show's genre, reviews on the show, and all of the show's performance times.
## How does it work?
  The Ruby on Rails backend communicates with the AngularJS front end by means of exchanging JSON. So for example, when a user wants to login to our website the Angular JS passes us a JSON file that looks like this:

  ```
  {
    "user_info": {
      "email": "username@user.com",
      "password": "password"

      }   
  }
  ```
The database responds with the user's complete information after checking the database to see if that user exists and that their password is correct:

    ```
    {
      "success": true,
      "user_info": {
      "id": 8,
      "email": "username@user.com",
      "first_name": "John",
      "last_name": "Doe",
      "description": "check",
      "is_professional": true,
      "display_name": "John Doe",
      "image_url": "photo_aws_url_demo",
      "login_token": "obscured_to_avoid_hackage",
      "facebook_link": "facebook.com/johndoe",
      "twitter_link": "twitter.com/johndoe",
      "instagram_link": "instagram.com/johndoe",
      "youtube_link": "youtube.com/johndoe",
      "created_at": "04/16/2016",
      "titles": [
        {
          "id": 5,
          "title": "Lighting Director: XYZ Company"
        }
      ],
      "reviews": [
        {
          "id": 13,
          "opinion": "I had a great experience at Burning Coal.",
          "rating": null,
          "user_id": 8,
          "reviewee_id": 16,
          "reviewee_type": "Company"
        }
      ],
      "companies": [
        {
          "id": 16,
          "user_id": 8,
          "name": "XYZ Company",
          "hero_image_url": null,
          "profile_image_url": null,
          "description": "XYZ Company is a theatre company located in Durham, NC.",
          "website_link": "xyzcompany.com",
          "facebook_link": "facebook.com/xyzcompany",
          "twitter_link": "twitter.com/xyzcompany",
          "instagram_link": "instagram.com/xyzcompany",
          "youtube_link": "youtube.com/xyzcompany",
          "address": "123 Sesame St",
          "city": "Durham",
          "state": "NC",
          "zip_code": "27703",
          "created_at": "04/17/2016"
        }
        ]
      }
    }
    ```

And this is the information that populates the user's profile page.

Once a user is logged in, the login_token is what authenticates that user and enables them to create items on the-scenery.com.

When a user is browsing around our webpage and navigates to a performance this is the JSON that the back-end passes back to provide all the information associated with that performance:

```
{
  "performance": {
    "id": 1,
    "owner_id": 1,
    "image_url": "photo_aws_url_demo",
    "company_id": 1,
    "company_name": "Little Company",
    "name": "THE PIANO HAS BEEN DRINKING: A TOM WAITS CABARET",
    "description": "A benefit fundraiser",
    "hero_image_url": null,
    "profile_image_url": null,
    "production_image_url": null,
    "trailer_link": null,
    "ticket_link": null,
    "genre_id": [
      {
        "id": 1,
        "category": "Theatre",
        "genre_id": 1
      }
    ],
    "show_times": [
      {
        "id": 1,
        "event_id": 1,
        "event_type": "Performance",
        "begin_time": " 3:33",
        "venue_id": null,
        "address": "33 south st.",
        "city": "Durham",
        "state": "NC",
        "zip_code": "27703",
        "show_date": "04/21/2016",
        "cast_members": []
      }
    ],
    "reviews": [
      {
        "id": 18,
        "opinion": "I'm looking forward to it",
        "rating": null,
        "image_url": "photo_aws_url_demo",
        "reviewee_name": "THE PIANO HAS BEEN DRINKING: A TOM WAITS CABARET",
        "user_id": 7,
        "reviewee_id": 1,
        "reviewee_type": "Performance",
        "created_at": "04/18/2016",
        "display_name": "Steven"
      }
    ]
  }
}
```
In the same vein, this is what the JSON data looks like when they navigate to a company page:

```
{
  "company": {
    "id": 1,
    "user_id": 1,
    "user_image_url": "photo_aws_url_demo",
    "name": "Little Green Pig",
    "description": "We create stuff",
    "website_link": "http://www.yourwebsite.com/",
    "facebook_link": "www.facebook.com",
    "twitter_link": "www.twitter.com",
    "instagram_link": "www.instagram.com",
    "youtube_link": "www.youtube.com",
    "address": "",
    "city": "Durham",
    "state": "NC",
    "zip_code": "",
    "profile_image_url": null,
    "hero_image_url": null,
    "reviews": [
      {
        "id": 8,
        "opinion": "new review",
        "image_url": "photo_aws_url_demo",
        "reviewee_name": "Little Company",
        "rating": null,
        "user_id": 1,
        "reviewee_id": 1,
        "reviewee_type": "Company",
        "created_at": "04/17/2016",
        "display_name": "Jay"
      },
      {
        "id": 9,
        "opinion": "ksjdak",
        "image_url": "photo_aws_url_demo",
        "reviewee_name": "Little Company",
        "rating": null,
        "user_id": 7,
        "reviewee_id": 1,
        "reviewee_type": "Company",
        "created_at": "04/17/2016",
        "display_name": "Steven"
      },
      {
        "id": 10,
        "opinion": "New Review!!!!",
        "image_url": "photo_aws_url_demo",
        "reviewee_name": "Little Company",
        "rating": null,
        "user_id": 7,
        "reviewee_id": 1,
        "reviewee_type": "Company",
        "created_at": "04/17/2016",
        "display_name": "Steven "
      }
    ],
    "opportunities": [
      {
        "id": 1,
        "company_id": 1,
        "venue_id": null,
        "name": "Mew Opportunity",
        "description": "Play the role of hamlet",
        "contact_info": "littlecompany@gmail.com",
        "created_at": "04/17/2016"
      }
    ],
    "upcoming_performances": [
      {
        "id": 1,
        "company_id": 1,
        "owner_id": 1,
        "name": "THE PIANO HAS BEEN DRINKING: A TOM WAITS CABARET",
        "description": "A benefit fundraiser)",
        "trailer_link": null,
        "ticket_link": null,
        "production_image_url": null,
        "profile_image_url": null,
        "hero_image_url": null
      },
      {
        "id": 2,
        "company_id": 1,
        "owner_id": 1,
        "name": "THE NEW COLOSSUS",
        "description": "An original adaption of Anton Chekhov’s The Sea Gull",
        "trailer_link": null,
        "ticket_link": null,
        "production_image_url": null,
        "profile_image_url": null,
        "hero_image_url": null
      },
      {
        "id": 3,
        "company_id": 1,
        "owner_id": 1,
        "name": "Grounded, by George Brant",
        "description": "From the award-winning playwright of Elephant's Graveyard, George Brant",
        "trailer_link": null,
        "ticket_link": null,
        "production_image_url": null,
        "profile_image_url": null,
        "hero_image_url": null
      }
    ],
    "past_performances": []
  }
}
```

As you can see, all our information is passed to and from Ruby on Rails as JSON.
