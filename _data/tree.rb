#!/usr/bin/env ruby
# From http://superuser.com/questions/359723/mac-os-x-equivalent-of-the-ubuntu-tree-command
def tree_hierarchy( root, &children )
  queue = [[root,"",true]]
  [].tap do |results|
    until queue.empty?
      item,indent,last = queue.pop
      kids = children[item]
      extra = indent.empty? ? '' : last ? '└╴' : '├╴'
      results << [ indent+extra, item ]
      results << [ indent, nil ] if last and kids.empty?
      indent += last ? '  ' : '│ '
      parts = kids.map{ |k| [k,indent,false] }.reverse
      parts.first[2] = true unless parts.empty?
      queue.concat parts
    end
  end
end
def tree(dir)
  cols = tree_hierarchy(File.expand_path(dir)) do |d|
    File.directory?(d) ? Dir.chdir(d){ Dir['*'].map(&File.method(:expand_path)) } : []
  end.map do |indent,path|
    if path
      file = File.basename(path) + File.directory?(path) ? '/' : ''
      meta = `ls -lhd "#{path}"`.split(/\s+/)
      [ [indent,file].join, meta[0], meta[4], "%s %-2s %s" % meta[5..7] ]
    else
      [indent]
    end
  end
  maxs = cols.first.zip(*(cols[1..-1])).map{ |c| c.compact.map(&:length).max }
  tmpl = maxs.map.with_index{ |n,i| "%#{'-' if cols[0][i][/^\D/]}#{n}s" }.join('  ')
  cols.map{ |a| a.length==1 ? a.first : tmpl % a }
end
puts tree(ARGV.first || ".") if __FILE__==$0