namespace :import do
  task countries: :environment do
    # c = ISO3166::Country.new('RU')
    all_countries = ISO3166::Country.all
    p "all counries: #{all_countries.count}"



    all_countries.each do |iso_country|
      country = Country.find_or_create_by(country_code: iso_country.alpha2)

      iso_country.subdivisions.each do |sub|
        sub_code = sub[0]
        sub_name = sub[1]['name']
        sub_trans = sub[1]['translations']

        Subdivision.find_or_create_by(country: country, code: sub_code)
        Translation.find_or_create_by(locale: 'en', key: "country.code.#{iso_country.alpha2}.subdivision.code.#{sub_code}", value: sub_name)
        Translation.find_or_create_by(locale: 'ru', key: "country.code.#{iso_country.alpha2}.subdivision.code.#{sub_code}", value: sub_trans)
      end

      Translation.find_or_create_by(locale: 'en', key: "country.code.#{iso_country.alpha2}", value: iso_country.name)
      Translation.find_or_create_by(locale: 'ru', key: "country.code.#{iso_country.alpha2}", value: iso_country.translation('ru'))
    end

  end
end
