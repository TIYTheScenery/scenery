# The Scenery


# What can it do?
  The application supplies a Rails database Api to support our front end Angular site.  It has a number of different subsets of use:
    * Search Feature
      1. Keyword Search: Entering any word or phrase in the search text field will run through all Companies, Performances, and Professionals in the database to return any that have the word or phrase in their name, title, or description.
      2. Advanced Search options allow:
        * Search by Genre (Theatre, Improve, Dance, or Film)
        * Search by Type (Professionals, Companies, or Performances.)
        * Search by City, State, or Zip Code
    * Sign Up
      1. User is given the option to be a Professional on the site when they sign up.
        * Professionals have the ability to create Companies, Performances, and Opportunities. They can also leave Reviews.
        * Non Professional Users can search all information in the database and leave Reviews on the Companies and Performances as well.
    * Profile Page
      1. Every user can upload a profile Picture, edit their information, and add a description to their page.  
      2. All of the Reviews they have left on the site will populate their page.
      3. Professionals can have the above features as well as:
        * Social Media Links.
        * Title to denote their skill set.
        * All of the Companies they have created listed.
    * Company Page
      1. Can add a background image as well as a profile picture for the company.
      2. It lists the reviews of your Company.
      3. It lists your upcoming performances as well as your past performances.
        * Clicking on the performance will bring you to that Performance's show page.
      4. Displays social media links, website link, location, and Company description.
      5. Displays the Opportunities you have created.
        * Opportunities can be audition notices, job postings, or anything other need for outside collaborators your Company needs.
    * Performance Page
      1. Displays your Company's name and the Performance name.
      2. Has the Performance's description, ticketing link, trailer link, tags to refine the show's genre, reviews on the show, and all of the show's performance times.
# How does it work?
