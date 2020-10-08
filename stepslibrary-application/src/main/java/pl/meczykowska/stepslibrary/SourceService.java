package pl.meczykowska.stepslibrary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.meczykowska.stepslibrary.domain.Source;
import pl.meczykowska.stepslibrary.domain.Step;

import java.util.List;


@Service
public class SourceService {

    @Autowired
    ISourceRepository repository;

    public void saveSource(Source source) {
        repository.save(source);
    }

    public void deleteSourceById(int index){
        repository.deleteById(index);
    }

    public List<Source> findAllSourcesByStep(Step step) {
        return repository.findAllByStep(step);
    }

}