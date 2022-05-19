# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

### scaffold commands

```bash
rails g annotate:install

rails g scaffold Board board_name:string --skip-assets --skip-helper --skip-stylesheets --skip-jbuilder
rails g scaffold Epic board:references epic_name:string cost:integer --skip-assets --skip-helper --skip-stylesheets --skip-jbuilder
rails g scaffold Issue epic:references issue_name:string description:string --skip-assets --skip-helper --skip-stylesheets --skip-jbuilder

rails g scaffold SubBoard board_name:string --skip-assets --skip-helper --skip-stylesheets --skip-jbuilder
rails g scaffold SubEpic sub_board:references epic_name:string cost:integer --skip-assets --skip-helper --skip-stylesheets --skip-jbuilder
rails g scaffold SubIssue sub_epic_:references issue_name:string description:string --skip-assets --skip-helper --skip-stylesheets --skip-jbuilder

rails g scaffold BoardAncestry board_name:string --skip-assets --skip-helper --skip-stylesheets --skip-jbuilder
rails g scaffold EpicAncestry board_ancestry:references epic_name:string cost:integer --skip-assets --skip-helper --skip-stylesheets --skip-jbuilder
rails g scaffold IssueAncestry epic_ancestry:references issue_name:string description:string --skip-assets --skip-helper --skip-stylesheets --skip-jbuilder

rails g scaffold BoardClosure board_name:string --skip-assets --skip-helper --skip-stylesheets --skip-jbuilder
rails g scaffold EpicClosure board_closure:references epic_name:string cost:integer --skip-assets --skip-helper --skip-stylesheets --skip-jbuilder
rails g scaffold IssueClosure epic_closure:references issue_name:string description:string --skip-assets --skip-helper --skip-stylesheets --skip-jbuilder

rails g controller home index --skip-assets --skip-helper --skip-stylesheets --skip-jbuilder

rails g migration add_ancestry_to_board_ancestry ancestry:string:index
```
