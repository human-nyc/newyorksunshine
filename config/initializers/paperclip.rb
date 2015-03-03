Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:url] = 's3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
# Paperclip::Attachment.default_options[:styles] = {
#   :mini => '80x50#',
#   :small => '160x100#',
#   :product => '480x300#',
#   :large => '1280x800#'
# }
Paperclip::Attachment.default_options[:convert_options] = { :thumb => '-quality 75 -strip', :content => '-quality 75 -strip -interlace Plane'}