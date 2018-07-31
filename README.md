# Welcome to TimeToInvoice!

## Installation:

These instructions assume that you have Ruby 2.4.1 and Rails 5.2.0 installed or ready to go with your preferred Ruby version manager. Feel free to reach out to me via e-mail for further assistance!

* Clone this repo. Navigate to where you'd like this project to be stored first!
`$ git clone https://github.com/aaronrohrbacher/TimeToInvoice.git`

* Navigate to the project directory, and install dependencies:
`$ bundle install`

* Set up the database (I'm using Postgres, it would probably work with mySQL too, maybe some migration adjustments for 'text')
`$ rails db:setup`

* Should be ready for some `rails s` action!

* Visit `http://localhost:3000` in your preferred web browser (I've only tested in Chrome).

## Usage:

* The previous `rails db:setup` should have seeded a user:
e-mail: test@test.com
password: 111111

* Once logged in, the first step is to create a company to invoice. You won't be able to create invoices without companies to invoice.

* Once at least one company is created, you can create an invoice. Click 'New Invoice,' select a company, and fill out the details. Clicking 'Submit' will tell you if you made a mistake, or move on with the process.

* Your invoice is now created, and you can add line items, or track time to create line items.

#### Create a line item:

* From your invoice, click on "Add Line Item."

* Fill out the form, and click 'Submit.' If you add notes, they will show up in yellow on your invoice. If you don't, they won't. You'll see a preview of your line items as you add them.

* Add as many line items as you'd like, and click 'Return to Invoice.' You can easily continue to add line items as you wish from the invoice by clicking 'Add Line Items' again, so no worries!

* From the Invoice, you can edit or delete a line item easily.

#### Time Tracking

* Instead of adding a line item, you can click 'Track Time' from your invoice. This feature automatically adds a line item for any amount of time worked on a date (basically a time clock). You can continuously add either line items or time tracker items, and you can track multiple time periods on a single date.

* Click 'Track Time' from your invoice. Enter a date, rate, start time, and select "start" from the dropdown. Click "submit."

* The "Date" and "Rate" fields will no longer be available. You've begun a work period (yes, it's a time clock), so these will remain consistent for this time-tracking session.

* Continue adding "end" and "start" times. Be aware that the system will not allow you to add two "start" or two "end" times in a row. If you make a mistake, you can easily click "Destroy" next to the mistaken time record, without having to start over.

* When you're done with the work period's "punches," click "Add to invoice." If you did well, you'll return to your invoice with line items added reflecting the amount of time worked for the period you've entered time for. Again, you can add multiple time tracked line items for the same day, or do a full day at once. If you fucked up, you will return to the time-tracking page, and you'll have the opportunity to fix it easily (your time records won't disappear).

# Known Issues

#### This thing is screaming for JavaScript.
I will (probably) put a front end on this at some point. That said, I've been careful to isolate models/controllers/views, in the spirit of refactoring to an API and adding React/Vue/Angular (or at least using AJAX on Rails). Definitely a back end project right now!

#### Users
* It's a pain in the ass to create a controller for Devise that allows for editing a user, while not allowing for "sign-up" of a user. I went with all-or nothing. You can easily create a user (see the DB schema) via the rails console. The ultimate goal is to allow for user sign-up, which makes editing easy, but I'm not ready to allow for user sign-up, as I use this in production.

* Next "release" will separate account information from the Devise user model (which will also help with the above issue).

#### General Laziness
* Adding time records displays the full Date and full Time provided by rails in the preview. Could have fixed it in the amount of it it's taking me to write this. Silly.
