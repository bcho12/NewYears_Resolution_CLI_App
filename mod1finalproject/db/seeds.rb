require_relative '../config/environment'
require 'active_record'
require_relative "../lib/resolution.rb"
require_relative "../lib/category.rb"
require_relative "../lib/resolution_category.rb"

#resolutions
workout = Resolution.find_or_create_by(content: "Work out 5 days a week")
job = Resolution.find_or_create_by(content: "Get a job as a developer")
art = Resolution.find_or_create_by(content: "Get better at art")

#categories
health = Category.find_or_create_by(name: "health")
professional = Category.find_or_create_by(name: "professional")
personal = Category.find_or_create_by(name: "personal")
continuous = Category.find_or_create_by(name: "continuous")

workout.categories << health
workout.categories << continuous
workout.categories << personal
job.categories << professional
art.categories << personal
art.categories << continuous
