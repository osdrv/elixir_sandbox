defmodule Forecast.Xpath do

  def find(xml, path) do
    _find(xml,
          String.split(path, ".")
            |> Enum.map &to_char_list/1
        )
  end

  defp _find(_, []), do: []
  defp _find({ tag_name, attrs, children }, [lookup]) when tag_name == lookup do
    [{ tag_name, attrs, children }]
  end
  defp _find({ tag_name, _attrs, children }, [lookup | tail]) when tag_name == lookup do
    children
      |> Enum.map &(_find(&1, tail))
  end
  defp _find({ _tag_name, _attrs, [] }, _lookup), do: []
  defp _find({ _tag_name, _attrs, _children }, _lookup), do: []
  defp _find(_tag, []), do: []

end

