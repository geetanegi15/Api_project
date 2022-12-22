class Company < ApplicationRecord
    has_many :employees

    has_attached_file :image , styles: {thumb: "50x50>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


    has_attached_file :video , styles: {:thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}},
                                         :processors => [:transcoder]
    validates_attachment_content_type :video, content_type: /\Avideo\/.*\z/ 


    def image_url
        image.url(:thumb)
    end

    def video_url
        video.url(:thumb)
    end
end
