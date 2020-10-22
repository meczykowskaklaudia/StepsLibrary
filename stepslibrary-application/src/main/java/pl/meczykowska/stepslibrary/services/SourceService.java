package pl.meczykowska.stepslibrary.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import pl.meczykowska.stepslibrary.domain.Source;
import pl.meczykowska.stepslibrary.domain.Step;
import pl.meczykowska.stepslibrary.repositories.ISourceRepository;

import java.util.List;


@Service
public class SourceService {

    @Autowired
    ISourceRepository repository;

    public void addSource(Source source) {
        repository.save(source);
    }

    @Secured("ROLE_ADMIN")
    public void deleteSourceById(int index) {
        repository.deleteById(index);
    }

    public List<Source> findAllSourcesByStep(Step step) {
        return repository.findAllByStep(step);
    }
}