require 'i18n/backend/active_record'
I18n.backend = I18n::Backend::ActiveRecord.new

Rails.application.config.i18n.available_locales = [:ru, :en, :fr]
