.PHONY: default clean

SPEC=harbour-fileman-root.spec
SOURCES=icons harbour-fileman-root.desktop start-root-helper.c

default: $(SOURCES) $(SPEC)
	rm -rf build
	mkdir build
	cp -r $(SOURCES) build
	cd build && rpmbuild --define "debug_package %{nil}" --define "_rpmdir ../RPMS" --target "$(BUILDARCH)" -bb --build-in-place "../$(SPEC)"

clean:
	rm -rf build
