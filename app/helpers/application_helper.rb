module ApplicationHelper
  def mailchimp_form_url
    "//railsbridgeboston.us6.list-manage.com/subscribe/post?u=1b4272afae4569dec6efb74bb&id=1ec91857a1"
  end

  def venue_map_url
    "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2948.1159095133034!2d-71.08135500000003!3d42.36136900000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89e370a423d61825%3A0x58516248462c99eb!2sMicrosoft+New+England+Research+and+Development+Center!5e0!3m2!1sen!2sus!4v1425584974378"
  end

  def data_links
    @data_links ||= YAML.load_file(Rails.root.join("app/data/links.yml"))
  end
end
