class WelcomeController < ApplicationController
  def index
    country = Country.find_by(country_code: 'RU')
    subdivision = country.subdivisions.find_by(code: 'YAR')
    @country_name = I18n.t("country.code.#{country.country_code}")
    @subdivision_name = I18n.t("country.code.#{country.country_code}.subdivision.code.#{subdivision.code}")
  end
end
