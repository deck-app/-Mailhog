# A Test Mail Server for a PHP Docker Container
For a small PHP project, I created a Docker container with an Apache and PHP in order to ease local development and setup. But that was not enough because my PHP application also sends mails and I wanted to test this feature locally as well. That’s why I needed a local SMTP server for testing and integrate it into my current Docker composition. In this brief post, I show you how I achieved this.

![ScreenShot](https://github.com/nabad600/Mailhog/blob/main/featured-image-500.png)

# If our PHP application now calls mail() it will trigger mhsendmail which in turn sends the mail to MailHog.

![ScreenShot](https://github.com/nabad600/Mailhog/blob/main/rerd.JPG)

The mail should show up in the MailHog UI under http://localhost/. We don’t even have to refresh the browser!
![ScreenShot](https://github.com/nabad600/Mailhog/blob/main/mailhog-screenshot.png)

Moreover, we can consume the HTTP API of MailHog in our tests and verify that our PHP application has sent a mail correctly. The URL http://localhost/api/v2/messages is a good starting point. It returns something like this:
![ScreenShot](https://github.com/nabad600/Mailhog/blob/main/maap.JPG)
