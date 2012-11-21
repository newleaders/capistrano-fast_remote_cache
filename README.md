# Capistrano Fast Remote Cache

A gem built from the original 37 Signals fast_remote_cache rails plugin. Think of this gem as one less deprecation message for your stubborn Rails apps.

## Installation

Add this line to your application's Gemfile:

    gem "capistrano-fast_remote_cache"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-fast_remote_cache

## Usage

In your deploy.rb or Capfile:

    require "capistrano/fast_remote_cache"

Set the Capistrano deployment strategy in the same file with:

    set :deploy_via, :fast_remote_cache

_Note the stragey name!_

To exclude certain directories or files from being deployed, set the copy_exclude variable (can also include glob patterns):

    set :copy_exclude, %w(test .git doc config/database.yml)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## From the Original Plugin README

The FastRemoteCache is a custom deployment strategy that specializes the standard RemoteCache strategy. It works just like the RemoteCache, but instead of actually copying the cache to the final release directory, it uses a custom "copy.rb" script to hard link the files. This allows the copy stage to be very fast.

For small applications, and especially for those that aren't bundling vendor/rails, this won't make much of a difference. But for large applications the speed-up will be significant.

### Dependencies

* Capistrano 2 or later (http://www.capify.org)

### Assumptions

The FastRemoteCache, as the RemoteCache, assumes that your source repository is accessible from both your local (deploying) host, as well as the remote (target) hosts. If either of these is not true, you will not be able to use the FastRemoteCache strategy.

Furthermore, it assumes that you have Ruby (1.8.6, preferably) installed on the target machines. If it is not installed in a standard location, you can set the :ruby variable to the location of the ruby executable.

### Tips

For the fastest possible deploys:

* Always deploy as the same user. If you're part of a team where everyone can (and does) deploy, create a new user (e.g., "deploy") and set it up so that your team can all log in as this user. Make sure this user also has read access to your source code repository.
* Avoid sudo if at all possible. set(:use_sudo, false), and then make sure that the deploy user has sufficient permissions to start and stop the mongrels, write to the necessary directories, etc.
* Disable the "group_writable" setting: set(:group_writable, false). This is only necessary when you have multiple users deploying.
* Don't include Rails (or other large libraries) in your application. Yes, it is convenient to include them, but they bloat your app and make checkouts and copies much slower. You have to balance convenience in development versus speed of deployment. Find a compromise that works for you.

### License

This code is released under the MIT license, and is copyright (c) 2008 by 37signals, LLC. Please see the accompanying LICENSE file for the full text of the license.

Modified for Gem release by New Leaders 2012.
