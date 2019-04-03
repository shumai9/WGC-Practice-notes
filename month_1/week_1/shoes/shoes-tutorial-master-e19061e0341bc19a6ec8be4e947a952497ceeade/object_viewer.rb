Shoes.app :title => "Shoes Object Viewer" do

  stack :margin => 20 do
    flow do
      para "Object: "
      edit_line do |input_box|
        begin
          selected_class = Kernel.const_get(input_box.text)

          @output.text = "Bingo! Over to you..."
        rescue
          @output.text = "There isn't a Ruby class called #{input_box.text}"
        end
      end
    end

    @output = edit_box width: "100%", height: 400
  end

end